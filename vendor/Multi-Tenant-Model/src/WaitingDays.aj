
// This class gets the data?

import java.util.Random;

public aspect WaitingDays {
	
	private static final Random random = new Random(System.currentTimeMillis());
	private static final int MAX_SLEEP = 1500;
	
	String around(GeneralTask t) : target(t) && call(String GeneralTask.getStatus())  {
		// Add a random amount of waiting before the status is queried to simulate time passing.
		try {
			Thread.sleep(random.nextInt() % MAX_SLEEP);
		} 
		catch(Exception e){
			
		}
		long time = System.currentTimeMillis() - t.getTimeStarted();
		return proceed(t) + "Time Spent in {" + t.getState() + "}: " + time + " ms";
	}
}
