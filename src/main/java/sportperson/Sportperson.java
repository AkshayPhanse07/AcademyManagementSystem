package sportperson;

public class Sportperson {
    private String sportpersonid;
    private String name;
    private String gender;
    private String dob;
    private int age;
    
    private String status;
    private String email;
    private String phone;
    private String address;
    private String nationality;

    // Constructors
    public Sportperson() {
    }

    public Sportperson(String sportpersonid, String name, String gender, String dob, int age, String status, String email, String phone, String address, String nationality) {
        this.sportpersonid = sportpersonid;
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.age = age;
       
        this.status = status;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.nationality = nationality;
    }

    // Getters and Setters
    public String getSportpersonid() {
        return sportpersonid;
    }

    public void setSportpersonid(String sportpersonid) {
        this.sportpersonid = sportpersonid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    // toString method for debugging
    @Override
    public String toString() {
        return "Sportperson{" +
                "sportpersonid='" + sportpersonid + '\'' +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", dob='" + dob + '\'' +
                ", age=" + age +
               
                ", status='" + status + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", nationality='" + nationality + '\'' +
                '}';
    }
}
