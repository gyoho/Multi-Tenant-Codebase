public class GeneralTask {
	
	private Integer hoursEstimated;
	private String status = "";
	
	public GeneralTask(){
		
	}
	
	public GeneralTask(Integer hoursEstimated){
		this.hoursEstimated = hoursEstimated;
	}
	
	public Integer getHoursEstimated(){
		return hoursEstimated;
	}
	
	public void setHoursEstimated(Integer hoursEstimated){
		this.hoursEstimated = hoursEstimated;
	}
	
	public String getStatus(){
		return status;
	}
	
	public void setStatus(String status){
		this.status = status;
	}
	
	public void trackActivity(Integer progress){
	}
	
	public static void main(String[] args) {		
		GeneralTask t = new GeneralTask(12);
		t.getStatus();
		t.trackActivity(5); 
		t.getStatus();
		t.trackActivity(7);
		t.getStatus();
		t.trackActivity(2);
		t.getStatus();
		t.trackActivity(0);
		t.getStatus();
		t.trackActivity(12);
		t.getStatus();
	}

}
