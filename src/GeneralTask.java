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
		System.out.println("Status #0: " + t.getStatus());
		t.trackActivity(5); 
		System.out.println("Status #1: " + t.getStatus());
		System.out.println("Status #2: " + t.getStatus());
		t.trackActivity(7);
		System.out.println("Status #3: " + t.getStatus());
		t.trackActivity(2);
		System.out.println("Status #4: " + t.getStatus());
		t.trackActivity(0);
		System.out.println("Status #5: " + t.getStatus());
		t.trackActivity(12);
		System.out.println("Status #6: " + t.getStatus());
	}

}
