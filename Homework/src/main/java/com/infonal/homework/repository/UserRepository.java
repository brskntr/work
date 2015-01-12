package com.infonal.homework.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import com.infonal.homework.model.User;

@Repository
public interface UserRepository extends  MongoRepository<User, String> {
	
	 	@Query("{ '_id' : ?0 }")
	 	User findById(String _id);
}
