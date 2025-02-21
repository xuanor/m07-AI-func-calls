// Defineix les eines/funcions que hi ha disponibles a flutter
const tools = [
  {
    "type": "function",
    "function": {
      "name": "draw_circle",
      "description": "Dibuixa un cercle amb un radi determinat, es poden definir el color del contorn, el gruix i el color d'emplenat.",
      "parameters": {
        "type": "object",
        "properties": {
          "x": {"type": "number"},
          "y": {"type": "number"},
          "radius": {"type": "number"},
          "borderColor": {"type": "string", "description": "Color del contorn en format hexadecimal (#RRGGBB)"},
          "borderWidth": {"type": "number", "description": "Gruix del contorn"},
          "fillColor": {"type": "string", "description": "Color d'emplenat en format hexadecimal (#RRGGBB)"}
        },
        "required": ["x", "y", "radius"]
      }
    }
  },
  {
    "type": "function",
    "function": {
      "name": "draw_line",
      "description": "Dibuixa una línia entre dos punts amb la possibilitat d'especificar el color i el gruix.",
      "parameters": {
        "type": "object",
        "properties": {
          "startX": {"type": "number"},
          "startY": {"type": "number"},
          "endX": {"type": "number"},
          "endY": {"type": "number"},
          "color": {"type": "string", "description": "Color de la línia en format hexadecimal (#RRGGBB)"},
          "thickness": {"type": "number", "description": "Gruix de la línia"}
        },
        "required": ["startX", "startY", "endX", "endY"]
      }
    }
  },
  {
    "type": "function",
    "function": {
      "name": "draw_rectangle",
      "description": "Dibuixa un rectangle amb opcions de contorn, emplenat i gradients.",
      "parameters": {
        "type": "object",
        "properties": {
          "topLeftX": {"type": "number"},
          "topLeftY": {"type": "number"},
          "bottomRightX": {"type": "number"},
          "bottomRightY": {"type": "number"},
          "borderColor": {"type": "string", "description": "Color del contorn en format hexadecimal (#RRGGBB)"},
          "borderWidth": {"type": "number", "description": "Gruix del contorn"},
          "fillColor": {"type": "string", "description": "Color d'emplenat en format hexadecimal (#RRGGBB)"},
          "gradient": {"type": "object", "properties": {
            "startColor": {"type": "string", "description": "Color inicial del gradient"},
            "endColor": {"type": "string", "description": "Color final del gradient"},
            "type": {"type": "string", "enum": ["linear", "radial"], "description": "Tipus de gradient"}
          }}
        },
        "required": ["topLeftX", "topLeftY", "bottomRightX", "bottomRightY"]
      }
    }
  },
  {
    "type": "function",
    "function": {
      "name": "draw_text",
      "description": "Dibuixa un text amb tipografia, mida i estil personalitzats.",
      "parameters": {
        "type": "object",
        "properties": {
          "x": {"type": "number"},
          "y": {"type": "number"},
          "text": {"type": "string"},
          "fontSize": {"type": "number", "description": "Mida de la tipografia"},
          "fontFamily": {"type": "string", "description": "Nom de la tipografia"},
          "fontWeight": {"type": "string", "enum": ["normal", "bold"], "description": "Pes de la lletra"},
          "color": {"type": "string", "description": "Color del text en format hexadecimal (#RRGGBB)"}
        },
        "required": ["x", "y", "text"]
      }
    }
  }
];

