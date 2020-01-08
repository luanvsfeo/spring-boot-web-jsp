/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.luan.springproject.controller;

import com.luan.springproject.exception.ResourceNotFoundException;
import com.luan.springproject.model.Cartorio;
import com.luan.springproject.repository.CartorioRepository;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;
import org.springframework.ui.ModelMap;

/**
 *
 * @author Luan
 */
@RestController
@RequestMapping("/api")
public class CartorioController {

    @Autowired
    CartorioRepository cartorioRepository;

    @GetMapping("/cartorios")
    public List<Cartorio> getAllCartorios() {
        return cartorioRepository.findAll();
    }

    @PostMapping("/cartorios")
    public Cartorio createCartorio(@Valid @RequestBody Cartorio cartorio) {
        return cartorioRepository.save(cartorio);
    }

    @GetMapping("/cartorios/{id}")
    public Cartorio getCartorioById(@PathVariable(value = "id") Long cartorioId) {
        return cartorioRepository.findById(cartorioId)
                .orElseThrow(() -> new ResourceNotFoundException("Cartorio", "id", cartorioId));

    }

    @PutMapping("/cartorios/{id}")
    public Cartorio updateCartorio(@PathVariable(value = "id") Long cartorioId,
            @Valid @RequestBody Cartorio cartorioDetails) {

        Cartorio cartorio = cartorioRepository.findById(cartorioId)
                .orElseThrow(() -> new ResourceNotFoundException("Cartorio", "id", cartorioId));

        cartorio.setNome(cartorioDetails.getNome());
        Cartorio updatedCartorio = cartorioRepository.save(cartorio);
        return updatedCartorio;
    }

    @DeleteMapping("/cartorios/{id}")
    public ResponseEntity<?> deleteCartorio(@PathVariable(value = "id") Long cartorioId) {

        Cartorio cartorio = cartorioRepository.findById(cartorioId)
                .orElseThrow(() -> new ResourceNotFoundException("Cartorio", "id", cartorioId));

        cartorioRepository.delete(cartorio);

        return ResponseEntity.ok().build();
    }

}
