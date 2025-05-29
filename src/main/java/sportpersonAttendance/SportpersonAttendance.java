package sportpersonAttendance;

public class SportpersonAttendance {
    private String sportpersonid;
    private String date;
    private String status;

    // Constructors
    public SportpersonAttendance() {}

    public SportpersonAttendance(String sportpersonid, String date, String status) {
        this.sportpersonid = sportpersonid;
        this.date = date;
        this.status = status;
    }

    // Getters and Setters
    public String getSportpersonid() {
        return sportpersonid;
    }

    public void setSportpersonid(String sportpersonid) {
        this.sportpersonid = sportpersonid;
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
        return "SportpersonAttendance{" +
                "sportpersonid='" + sportpersonid + '\'' +
                ", date='" + date + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
