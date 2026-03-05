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
                "SELECT ss FROM StudentScore ss JOIN FETCH ss.student JOIN FETCH ss.subject ORDER BY ss.studentScoreId",
                StudentScore.class
            ).getResultList();
        } finally {
            em.close();
        }
    }

    public StudentScore findById(int id) {
        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
        try {
            return em.find(StudentScore.class, id);
        } finally {
            em.close();
        }
    }

    public void update(StudentScore score) {
        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(score);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    public long countAll() {
        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
        try {
            return em.createQuery("SELECT COUNT(ss) FROM StudentScore ss", Long.class)
                .getSingleResult();
        } finally {
            em.close();
        }
    }

    public List<StudentScore> findPage(int offset, int limit) {
        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
        try {
            return em.createQuery(
                "SELECT ss FROM StudentScore ss JOIN FETCH ss.student JOIN FETCH ss.subject ORDER BY ss.studentScoreId",
                StudentScore.class
            )
                .setFirstResult(offset)
                .setMaxResults(limit)
                .getResultList();
        } finally {
            em.close();
        }
    }
}
