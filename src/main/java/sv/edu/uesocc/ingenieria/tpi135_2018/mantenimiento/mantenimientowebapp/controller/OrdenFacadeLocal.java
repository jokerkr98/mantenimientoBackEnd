/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.uesocc.ingenieria.tpi135_2018.mantenimiento.mantenimientowebapp.controller;

import java.util.List;
import javax.ejb.Local;
import sv.edu.uesocc.ingenieria.tpi135_2018.mantenimiento.mantenimientowebapp.entity.Orden;

/**
 *
 * @author joker
 */
@Local
public interface OrdenFacadeLocal extends AbstractInterface<Orden> {
    
    
    public List<Orden> findByActivo();
    
    public List<Orden> findByInactivo();
    


}
