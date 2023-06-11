package com.asm.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.asm.model.RoleDetail;



@Repository
public interface RoleDetailRepo extends JpaRepository<RoleDetail, Long>{

}
