package coachAttendance;

public class CoachAttendance {
    private String coachid;
    private String date;
    private String status;

    // Constructors
    public CoachAttendance() {}

    public CoachAttendance(String coachid, String date, String status) {
        this.coachid = coachid;
        this.date = date;
        this.status = status;
    }

    // Getters and Setters
    public String getCoachid() {
        return coachid;
    }

    public void setCoachid(String coachid) {
        this.coachid = coachid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Attendance{" +
                "coachid='" + coachid + '\'' +
                ", date='" + date + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
