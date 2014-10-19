import java.util.ArrayList;

public aspect HoursRemaining {
	
	ArrayList<Integer> GeneralTask.hoursRemaining = new ArrayList<Integer>();
	
	pointcut inputRemainingHours(GeneralTask gt, Integer progress) : target(gt)
		&& call(public void trackActivity(Integer))
		&& args(progress);
	
	after() returning(GeneralTask gt):call(GeneralTask.new(..)) {
		gt.hoursRemaining.add(gt.getHoursEstimated());
	}
	
	after(GeneralTask gt, Integer progress):inputRemainingHours(gt, progress) {
		gt.hoursRemaining.add(progress);
	}
	
}
