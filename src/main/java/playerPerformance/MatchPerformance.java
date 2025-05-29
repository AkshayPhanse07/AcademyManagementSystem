package playerPerformance;

import java.util.Date;

public class MatchPerformance {
    private int id;
    private String playerId;
    private Date matchDate;
    
    // Batting stats
    private int runsScored;
    private int ballsFaced;
    private int fours;
    private int sixes;
    private double strikeRate;
    
    // Bowling stats
    private double oversBowled;
    private int wicketsTaken;
    private int runsConceded;
    private double economyRate;
    private double bowlingAverage;

    // Constructors
    public MatchPerformance() {}

    public MatchPerformance(String playerId, Date matchDate, int runsScored, int ballsFaced, int fours, int sixes, 
                            double strikeRate, double oversBowled, int wicketsTaken, int runsConceded, 
                            double economyRate, double bowlingAverage) {
        this.playerId = playerId;
        this.matchDate = matchDate;
        this.runsScored = runsScored;
        this.ballsFaced = ballsFaced;
        this.fours = fours;
        this.sixes = sixes;
        this.strikeRate = strikeRate;
        this.oversBowled = oversBowled;
        this.wicketsTaken = wicketsTaken;
        this.runsConceded = runsConceded;
        this.economyRate = economyRate;
        this.bowlingAverage = bowlingAverage;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPlayerId() {
        return playerId;
    }

    public void setPlayerId(String playerId) {
        this.playerId = playerId;
    }

    public Date getMatchDate() {
        return matchDate;
    }

    public void setMatchDate(Date matchDate) {
        this.matchDate = matchDate;
    }

    public int getRunsScored() {
        return runsScored;
    }

    public void setRunsScored(int runsScored) {
        this.runsScored = runsScored;
    }

    public int getBallsFaced() {
        return ballsFaced;
    }

    public void setBallsFaced(int ballsFaced) {
        this.ballsFaced = ballsFaced;
    }

    public int getFours() {
        return fours;
    }

    public void setFours(int fours) {
        this.fours = fours;
    }

    public int getSixes() {
        return sixes;
    }

    public void setSixes(int sixes) {
        this.sixes = sixes;
    }

    public double getStrikeRate() {
        return strikeRate;
    }

    public void setStrikeRate(double strikeRate) {
        this.strikeRate = strikeRate;
    }

    public double getOversBowled() {
        return oversBowled;
    }

    public void setOversBowled(double oversBowled) {
        this.oversBowled = oversBowled;
    }

    public int getWicketsTaken() {
        return wicketsTaken;
    }

    public void setWicketsTaken(int wicketsTaken) {
        this.wicketsTaken = wicketsTaken;
    }

    public int getRunsConceded() {
        return runsConceded;
    }

    public void setRunsConceded(int runsConceded) {
        this.runsConceded = runsConceded;
    }

    public double getEconomyRate() {
        return economyRate;
    }

    public void setEconomyRate(double economyRate) {
        this.economyRate = economyRate;
    }

    public double getBowlingAverage() {
        return bowlingAverage;
    }

    public void setBowlingAverage(double bowlingAverage) {
        this.bowlingAverage = bowlingAverage;
    }
}
