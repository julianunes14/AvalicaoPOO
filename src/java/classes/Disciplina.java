/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.util.ArrayList;

/**
 *
 * @author Júlia Nunes
 */
public class Disciplina {
    private String nome;
    private String ementa;
    private String ciclo;
    private Double nota;
    
    public Disciplina(String nome, String ementa, String ciclo){
        this.nome = nome;
        this.ciclo = ciclo;
        this.ementa = ementa;
        
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmenta() {
        return ementa;
    }

    public void setEmenta(String ementa) {
        this.ementa = ementa;
    }

    public String getCiclo() {
        return ciclo;
    }

    public void setCiclo(String ciclo) {
        this.ciclo = ciclo;
    }

    public Double getNota() {
        return nota;
    }

    public void setNota(Double nota) {
        this.nota = nota;
    }
    public static ArrayList<Disciplina> getList(ArrayList lista) {
        ArrayList<Disciplina> lstDisciplina = (ArrayList<Disciplina>)lista;
        
        return lstDisciplina;
    }
}
