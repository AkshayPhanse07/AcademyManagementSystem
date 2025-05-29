package application;

public class TrainingApplication {
    private int applicationId;
    private String firstName;
    private String lastName;
    private String gender;
    private String dob;
    private String fatherName;
    private String motherName;
    private String email;
    private String phone;
    private int age;
    private String address; 
    private String nationality; 
    private String primaryRole;
    private String battingStyle;
    private String bowlingStyle;
    private String fieldingPosition;
    private int experience;
    private int passingYear;
    private String highestLevel;
    private String qualification;
    private String schoolName;
    private String percentage;
    private String studying;
    private String trainingTime;
    private String application_date;
    

    // Default Constructor
    public TrainingApplication() {}

    // Parameterized Constructor
    public TrainingApplication(int applicationId, String firstName, String lastName, String gender, String dob,
                               String fatherName, String motherName, String email, String phone, int age, 
                               String address, String nationality, String primaryRole, String battingStyle, 
                               String bowlingStyle, String fieldingPosition, int experience, String highestLevel, 
                               String qualification, String schoolName, int passingYear, String percentage, 
                               String studying, String trainingTime, String applicationDate) {
        this.applicationId = applicationId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.dob = dob;
        this.fatherName = fatherName;
        this.motherName = motherName;
        this.email = email;
        this.phone = phone;
        this.age = age;
        this.address = address;
        this.nationality = nationality;
        this.primaryRole = primaryRole;
        this.battingStyle = battingStyle;
        this.bowlingStyle = bowlingStyle;
        this.fieldingPosition = fieldingPosition;
        this.experience = experience;
        this.highestLevel = highestLevel;
        this.qualification = qualification;
        this.schoolName = schoolName;
        this.passingYear = passingYear;
        this.percentage = percentage;
        this.studying = studying;
        this.trainingTime = trainingTime;
        this.application_date = applicationDate;
    }

    // Getters and Setters
    public int getApplicationId() {
        return applicationId;
    }

    public void setApplicationId(int applicationId) {
        this.applicationId = applicationId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
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

    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public String getMotherName() {
        return motherName;
    }

    public void setMotherName(String motherName) {
        this.motherName = motherName;
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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
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

    public String getPrimaryRole() {
        return primaryRole;
    }

    public void setPrimaryRole(String primaryRole) {
        this.primaryRole = primaryRole;
    }

    public String getBattingStyle() {
        return battingStyle;
    }

    public void setBattingStyle(String battingStyle) {
        this.battingStyle = battingStyle;
    }

    public String getBowlingStyle() {
        return bowlingStyle;
    }

    public void setBowlingStyle(String bowlingStyle) {
        this.bowlingStyle = bowlingStyle;
    }

    public String getFieldingPosition() {
        return fieldingPosition;
    }

    public void setFieldingPosition(String fieldingPosition) {
        this.fieldingPosition = fieldingPosition;
    }

    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }

    public String getHighestLevel() {
        return highestLevel;
    }

    public void setHighestLevel(String highestLevel) {
        this.highestLevel = highestLevel;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public int getPassingYear() {
        return passingYear;
    }

    public void setPassingYear(int passingYear) {
        this.passingYear = passingYear;
    }

    public String getPercentage() {
        return percentage;
    }

    public void setPercentage(String percentage) {
        this.percentage = percentage;
    }

    public String getStudying() {
        return studying;
    }

    public void setStudying(String studying) {
        this.studying = studying;
    }

    public String getTrainingTime() {
        return trainingTime;
    }

    public void setTrainingTime(String trainingTime) {
        this.trainingTime = trainingTime;
    }

    public String getApplicationDate() {
        return application_date;
    }

    public void setApplicationDate(String applicationDate) {
        this.application_date = applicationDate;
    }
    
    
}
