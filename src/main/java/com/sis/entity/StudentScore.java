package com.sis.entity;

import javax.persistence.*;

@Entity
@Table(name = "student_score_t")
public class StudentScore {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "student_score_id")
    private int studentScoreId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "student_id")
    private Student student;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "subject_id")
    private Subject subject;

    @Column(name = "score1")
    private double score1;

    @Column(name = "score2")
    private double score2;

    public StudentScore() {}

    public int getStudentScoreId() { return studentScoreId; }
    public void setStudentScoreId(int studentScoreId) { this.studentScoreId = studentScoreId; }

    public Student getStudent() { return student; }
    public void setStudent(Student student) { this.student = student; }

    public Subject getSubject() { return subject; }
    public void setSubject(Subject subject) { this.subject = subject; }

    public double getScore1() { return score1; }
    public void setScore1(double score1) { this.score1 = score1; }

    public double getScore2() { return score2; }
    public void setScore2(double score2) { this.score2 = score2; }

    /** Calculate weighted score: 0.3 * score1 + 0.7 * score2 */
    public double getCalculatedScore() {
        return 0.3 * score1 + 0.7 * score2;
    }

    /** Convert calculated score to letter grade */
    public String getGrade() {
        double score = getCalculatedScore();
        if (score >= 8.0) return "A";
        if (score >= 6.0) return "B";
        if (score >= 4.0) return "D";
        return "F";
    }
}
