package coach;

public class Coach {
    private String coachid;
    private String name;
    private int age;
    private String sport;
    private String email;
    private String phone;
    private String address;
    private String nationality;
    private String coachType; // Batting, Bowling, Fielding, etc.
    private int experience; // Years of experience (should be int)
    private String specialization; // Specific skills or expertise

    // Default Constructor
    public Coach() {
    }

    // Parameterized Constructor
    public Coach(String coachid, String name, int age, String sport, String email, String phone, String address, 
                 String nationality, String coachType, int experience, String specialization) {
        this.coachid = coachid;
        this.name = name;
        this.age = age;
        this.sport = sport;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.nationality = nationality;
        this.coachType = coachType;
        this.experience = experience;
        this.specialization = specialization;
    }

    // Getters and Setters
    public String getCoachid() {
        return coachid;
    }

    public void setCoachid(String coachid) {
        this.coachid = coachid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getSport() {
        return sport;
    }

    public void setSport(String sport) {
        this.sport = sport;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getCoachType() {
        return coachType;
    }

    public void setCoachType(String coachType) {
        this.coachType = coachType;
    }

    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    // toString method for debugging
    @Override
    public String toString() {
        return "Coach{" +
                "coachid='" + coachid + '\'' +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", sport='" + sport + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", nationality='" + nationality + '\'' +
                ", coachType='" + coachType + '\'' +
                ", experience=" + experience + // Fixed this formatting
                ", specialization='" + specialization + '\'' +
                '}';
    }
}
