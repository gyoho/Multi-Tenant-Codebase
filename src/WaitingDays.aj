
// This class gets the data?

public aspect WaitingDays {
	String around(GeneralTask t) : target(t) && call(String GeneralTask.getStatus())  {
		long time = System.currentTimeMillis() - t.getTimeStarted();
		return proceed(t) + "Time Spent in {" + t.getState() + "}: " + time + " ms";
	}
}
