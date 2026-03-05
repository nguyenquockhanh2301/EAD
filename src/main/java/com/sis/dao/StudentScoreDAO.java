package com.sis.dao;

import com.sis.entity.StudentScore;
import com.sis.util.JPAUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.util.List;

public class StudentScoreDAO {

    public void save(StudentScore score) {
        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(score);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    public List<StudentScore> findAll() {
        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
        try {
            return em.createQuery(
                "SELECT ss FROM StudentScore ss JOIN FETCH ss.student JOIN FETCH ss.subject",
                StudentScore.class
            ).getResultList();
        } finally {
            em.close();
        }
    }
}
