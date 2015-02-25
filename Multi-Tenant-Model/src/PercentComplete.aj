public aspect PercentComplete {

	pointcut getStatus(GeneralTask a) : target(a) 
	&& call(public String GeneralTask.getStatus());
	
	before(GeneralTask a): getStatus(a) {
		//System.out.println("Task :: trackActivity");
		int hoursEstimated = a.getHoursEstimated();
		int taskComplt = a.getTaskCompleted();
		if ( a.getTaskCompleted()  < hoursEstimated ) {
			int percentActivityDone = (int)(taskComplt)*100/(hoursEstimated);
            a.setStatus(percentActivityDone  + "% Task performed.");
        }
        else {
        	a.setStatus( "The task is already completed." ) ;
        }  
	}
}
