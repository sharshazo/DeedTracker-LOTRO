# Deed Tracker (con datos en español)

Addon para **The Lord of the Rings Online** que rastrea el progreso de
tus **hazañas (deeds)** — los logros del juego que otorgan puntos de
trasfondo/virtudes al completarse. Addon original de **Cube**; esta
versión suma contenido y datos completos en **español** (nombres,
descripciones, objetivos y categorías de cada hazaña).

## Qué hace

- Lista **todas** tus hazañas organizadas por categoría, con el
  progreso actual de cada una.
- Permite fijar/seguir hazañas específicas en un HUD flotante en
  pantalla (igual de práctico que un tracker de misiones).
- Te avisa apenas completás una hazaña.
- Soporta varios idiomas de contenido (español, inglés, alemán,
  francés, ruso).
- Permite importar/compartir el progreso entre distintos personajes de
  tu misma cuenta.

## Instalación — ⚠️ leer con atención, esta es la parte que confunde

A diferencia de la mayoría de los addons, **el archivo `.plugin` y la
carpeta de código NO van al mismo nivel**. Tenés que armar esta
estructura exacta dentro de tu carpeta de Plugins:

```
Documentos\The Lord of the Rings Online\Plugins\
└── CubePlugins\                  ← 1. creás esta carpeta nueva
    ├── DeedTracker.plugin        ← 2. este archivo SUELTO, al lado de la carpeta
    └── DeedTracker\              ← 3. esta carpeta (con TODO el código adentro)
        ├── Main.lua
        ├── DataFiles\
        └── ...
```

**Pasos:**

1. Dentro de `Documentos\The Lord of the Rings Online\Plugins\`, creá
   una carpeta nueva y renombrala a **`CubePlugins`** (si ya existe
   porque tenés otro addon de Cube instalado, usá esa misma).
2. Descargá este repositorio completo. Vas a tener una carpeta con
   `Main.lua`, `DataFiles\`, `DeedTracker.plugin`, etc. — todo junto.
3. Pegá **esa carpeta completa** dentro de `CubePlugins\`, y
   **renombrala a `DeedTracker`** (el nombre tiene que ser exacto: el
   addon lo tiene escrito a mano en su propio archivo `.plugin`).
4. Ahora, sacá el archivo **`DeedTracker.plugin`** de adentro de esa
   carpeta y **movelo un nivel para afuera**, para que quede suelto
   directamente dentro de `CubePlugins\` (no adentro de `DeedTracker\`).

Al final tiene que quedar exactamente como el dibujo de arriba: el
archivo `.plugin` y la carpeta `DeedTracker\` **uno al lado del otro**,
ambos dentro de `CubePlugins\`.

5. Abrí LOTRO → **Opciones → Plugins** (o escribí `/pluginmanager` en
   el chat) → tildá **"Deed Tracker"**.

**Por qué es así:** el archivo `.plugin` de este addon dice
`<Package>CubePlugins.DeedTracker.Main</Package>` — esa ruta está
escrita a mano por el autor original, así que los nombres de carpeta
tienen que ser exactamente esos, ni un nivel más arriba ni más abajo.
Si algo queda mal ubicado, el addon simplemente no va a aparecer en la
lista de plugins del juego (no da error, solo no aparece).

## Créditos

Addon original de **Cube**. Ver `readme.txt` para los créditos
completos del autor original.
