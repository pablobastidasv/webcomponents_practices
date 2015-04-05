package com.pablobastidas.model;

import java.util.ArrayList;
import java.util.List;

/**
 * Bean experto en obtener la información
 *
 * Created by pbastidas on 3/25/15.
 */
public class BeerExpert {

    public List<String> getBrands(String color){
        List<String> brands = new ArrayList<String>();

        if(color.equals("amber")){
            brands.add("Jack Amber");
            brands.add("Red Moose");
        }else{
            brands.add("Jail Pale Ale");
            brands.add("Gout Stout");
        }

        return brands;
    }
}
