package com.ms.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 系统响应：json数据实体
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DataGridView {
	
	private Integer code=0;
	private String msg="";
	private Long count=0L;
	private Object data;
	public DataGridView(Long count, Object data) {
		super();
		this.count = count;
		this.data = data;
	}
	public DataGridView(Object data) {
		super();
		this.data = data;
	}
}
