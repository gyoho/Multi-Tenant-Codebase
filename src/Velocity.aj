
public aspect Velocity {
	
	pointcut String getVelocity(GeneralTask gt) : target(gt)
	&& call(public String getStatus());

	after(GeneralTask gt):getVelocity(gt) {
		// introduce Class SimpleRegression
		SimpleRegression statistic = new SimpleRegression()
		
		// plot the hours into x-y plain and make the array
		for(int i=0; i<GeneralTask.hoursRemainging.size(); i++) {
			statistic.addData(i, (double)GeneralTask.hoursRemainging.get(i));
		}
		
		// get the slope
		double slope =  (-1)*statistics.getSlope();
		// parse to String
		String  velocity = String.valueOf(slope);
		
		// set the velocity as status
		gt.setStatus(velocity);
	}
}
