import java.util.ArrayList;

public aspect HoursRemaining {
	
	private ArrayList<Integer> GeneralTask.hoursRemainging = new ArrayList<Integer>();
	
	pointcut inputRemaingingHours(GeneralTask gt, Integer progress) : target(gt)
		&& call(public void trackActivity(Integer progress))
		&& args(progress);
	
	after(GeneralTask gt, Integer progress):inputRemaingingHours(gt, progress) {
		GeneralTask.hoursRemainging.add(progress);
	}
	
}
