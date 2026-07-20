package com.becksoft.meat.grill.dto;

import com.becksoft.meat.grill.enums.RoleName;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserCreationDTO {
    private String username;
    private String password;
    private RoleName roleName;
}
