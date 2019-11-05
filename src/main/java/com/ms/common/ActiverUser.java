package com.ms.common;

import com.ms.entity.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 
 * @author LJH
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ActiverUser {

	private User user;
	
	private List<String> roles;
	
	private List<String> permissions;
}
