import org.apache.commons.math3.stat.regression.SimpleRegression;

public aspect Velocity {
	
	String velocity;
	
	pointcut getVelocity(GeneralTask gt) : target(gt)
	&& call(public String getStatus());

	after(GeneralTask gt):getVelocity(gt) {
		// introduce Class SimpleRegression
		SimpleRegression statistic = new SimpleRegression();
		
		// plot the hours into x-y plain and make the array
		for(int i=0; i<gt.hoursRemaining.size(); i++) {
			statistic.addData(i, (double)gt.hoursRemaining.get(i));
//			System.out.println(i + "   "  + (double)gt.hoursRemaining.get(i));
		}
		
		// get the slope
		double slope =  (-1)*statistic.getSlope();
		if(Double.isNaN(slope)) {
			velocity = "Not enough information";
		} else {
			velocity = String.valueOf(slope);
		}
		
		// set the velocity as status
		gt.setStatus(velocity);
	}
}
