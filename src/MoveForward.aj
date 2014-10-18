
// This class gets the data?


public aspect MoveForward {
    // Introductions
    private long GeneralTask.timeStarted;
    private int GeneralTask.stateIndex;
    private static String[] GeneralTask.STATES = {"Backlog", "Requested", "In Progress", "Done"};
    
    // PointCut & Advice
	after() returning(GeneralTask t) : call(GeneralTask.new(..)) {
		t.timeStarted = System.currentTimeMillis();
		t.stateIndex = 0;
	}
	
	String around(GeneralTask t) : target(t) && call(String GeneralTask.getStatus())  {
		long time = System.currentTimeMillis() - t.timeStarted;
		return proceed(t) + "Time Spent in {" + GeneralTask.STATES[t.stateIndex] + "}: " + time + " ms";
	}
	
	after(GeneralTask t) : target(t) && call(void GeneralTask.trackActivity(..))  {
		if (t.stateIndex < GeneralTask.STATES.length - 1)
			t.stateIndex++;
	}
}
