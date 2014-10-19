
// This class sets the data?

public aspect MoveForward {
	
    // Introductions
	private static final String[] GeneralTask.STATES = {"Backlog", "Requested", "In Progress", "Done"};
	
    private int GeneralTask.stateIndex;
    private long GeneralTask.timeStarted;
    
    public String GeneralTask.getState(){
    	return GeneralTask.STATES[stateIndex];
    }
    
    public long GeneralTask.getTimeStarted(){
    	return timeStarted;
    }
    
    // PointCut & Advice
	after() returning(GeneralTask t) : call(GeneralTask.new(..)) {
		t.stateIndex = 0;
		t.timeStarted = System.currentTimeMillis();
	}
	
	after(GeneralTask t) : target(t) && call(void GeneralTask.trackActivity(..))  {
		if (t.stateIndex < GeneralTask.STATES.length - 1){
			t.stateIndex++;
			t.timeStarted = System.currentTimeMillis();
		}
	}
}
