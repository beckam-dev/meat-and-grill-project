package com.becksoft.meat.grill.config;

import com.becksoft.meat.grill.entity.Role;
import com.becksoft.meat.grill.enums.RoleName;
import com.becksoft.meat.grill.repository.RoleRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class DataInitializer implements CommandLineRunner {

    private final RoleRepository roleRepository;

    @Override
    public void run(String... args) throws Exception {
        // Si la tabla de roles está vacía, insertamos los roles por defecto para la demo
        if (roleRepository.count() == 0) {
            roleRepository.save(new Role(RoleName.ROLE_ADMIN));
            roleRepository.save(new Role(RoleName.ROLE_COCINA));
            roleRepository.save(new Role(RoleName.ROLE_MESERO));
            System.out.println("Roles base (ADMIN, COCINA, MESERO) creados con éxito desde DataInitializer.");
        }
    }
}