<div style="display: flex; width: 100%;">
    <div style="flex: 1; padding: 0px;">
        <p>© Albert Palacios Jiménez, 2023</p>
    </div>
    <div style="flex: 1; padding: 0px; text-align: right;">
        <img src="../assets/ieti.png" height="32" alt="Logo de IETI" style="max-height: 32px;">
    </div>
</div>
<br/>

# Eina de dibuix vectorial (amb IA)

Fent servir **function calls** fes una eina de dibuix assistida per IA, en la que els usuaris fan preguntes a la IA per fer dibuixos i escriure textos a l'aplicació.

Fes servir l'exemple 0801 com a base inicial, veuràs que l'exemple manté una llista de polígons que cal dibuixar i les seves propietats.

## Fase 1

S'ha de poder:

- Fer linies, cercles i quadres *
- Decidir el gruix de les linies i contorns *
- Decidir el color de les línies i contorns *
- Decidir el color dels emplenats dels polígons *
- Decidir els colors i tipus de gradient d'emplenat dels polígons *
- Dibuixar textos amb diferents tipografies, mides i estils (normal, negreta, ...) *

### Prompts de test:

Dibuixa un cercle a la posició (50, 50) amb un radi de 20. El contorn ha de ser de color blau (#0000FF) amb un gruix de 3 i l'emplenat ha de ser vermell (#FF0000).

Dibuixa una línia des del punt (10, 10) fins al punt (200, 100) amb un gruix de 5 i de color verd (#00FF00).

Dibuixa un rectangle amb cantonada superior esquerra a (20, 30) i inferior dreta a (150, 200). El contorn ha de ser negre (#000000) amb un gruix de 2, i l'emplenat ha de tenir un gradient lineal de groc (#FFFF00) a taronja (#FFA500). Dona'm el fillcolor amb aquest format: "fillColor": { "startColor": "#FFFF00", "endColor": "#FFA500" }

Dibuixa el text: "Hola, món!"; a la posició (100, 50) amb una mida de 24 punts, tipografia Arial, estil negreta i de color lila (#800080).

Dibuixa un cercle a la posició (75, 75) un radi de 30.

## Fase 2

S'ha de poder:

- Seleccionar polígons
- Esborrar polígons
- Canviar les propietats d'un polígon (color, mida del contorn, emplenat, posició ...)
- Fer consultes a partir dels % de la mida de dibuix disponibles o amb paraules tipus "a la meitat del dibuix", "la diagonal del quadre", ...

## Fase 3

S'ha de poder:

- Modificar la posició del polígon seleccionat arrossegant-lo amb el mouse
- Canviar les propietats del polígon seleccionat amb formularis sense ver servir el chat IA