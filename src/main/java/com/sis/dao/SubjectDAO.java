package com.sis.dao;

import com.sis.entity.Subject;
import com.sis.util.JPAUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class SubjectDAO {

    public Subject findById(int id) {
        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
        try {
            return em.find(Subject.class, id);
        } finally {
            em.close();
        }
    }

    public List<Subject> findAll() {
        EntityManager em = JPAUtil.getEntityManagerFactory().createEntityManager();
        try {
            return em.createQuery("SELECT s FROM Subject s", Subject.class).getResultList();
        } finally {
            em.close();
        }
    }
}
