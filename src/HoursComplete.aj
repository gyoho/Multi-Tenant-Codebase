public aspect HoursComplete {

	private int GeneralTask.taskCompleted;
	
	public int GeneralTask.getTaskCompleted() {
		return taskCompleted;
	}
	
	public void GeneralTask.setTaskCompleted(int taskCmplt) {
		taskCompleted = taskCmplt;
	}
	
	pointcut trackActivity(GeneralTask a,Integer hoursComplete) : target(a) 
	&& call(public void GeneralTask.trackActivity(Integer))
	&& args(hoursComplete);
	
	after(GeneralTask a,Integer hoursComplete): trackActivity(a,hoursComplete) {
		System.out.print("Task :: trackActivity");
		int hoursEstimated = a.getHoursEstimated();
		if ( (a.taskCompleted + hoursComplete) < hoursEstimated ) {
			a.taskCompleted = a.taskCompleted + hoursComplete;
			System.out.println( " The total hour of task activity done: " + a.taskCompleted ) ;
        }
        else {
            System.out.println( " The task is already completed." ) ;
        }  
	}
}
