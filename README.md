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

## Instalación (un solo zip, ya armado)

1. Descargá el zip de la [**última versión (Releases)**](https://github.com/sharshazo/DeedTracker-LOTRO/releases/latest).
2. Descomprimilo.
3. Pegá la carpeta **`CubePlugins`** completa (viene con todo adentro
   ya en su lugar) dentro de:
   ```
   Documentos\The Lord of the Rings Online\Plugins\
   ```
4. Abrí LOTRO → **Opciones → Plugins** (o escribí `/pluginmanager` en
   el chat) → tildá **"Deed Tracker"**.

Eso es todo — no hay que crear carpetas, renombrar nada, ni mover
archivos por separado. El zip ya trae el archivo `.plugin` y la
carpeta de código en el nivel exacto que el addon necesita.

<details>
<summary>¿Por qué el .plugin y el código van en niveles distintos? (para curiosos, o si descargás el código fuente en vez del zip)</summary>

El archivo `.plugin` de este addon dice
`<Package>CubePlugins.DeedTracker.Main</Package>` — esa ruta está
escrita a mano por el autor original: exige que `DeedTracker.plugin`
esté **suelto** dentro de una carpeta `CubePlugins\`, y el código
(`Main.lua`, `DataFiles\`, etc.) en una carpeta `DeedTracker\` **al
lado** de ese archivo, no adentro de otra cosa. Si algo queda mal
ubicado, el addon simplemente no va a aparecer en la lista de plugins
del juego (no da error, solo no aparece). El zip de Releases ya viene
armado así — este detalle solo importa si cloná el repositorio directo
en vez de usar el zip.
</details>

## Créditos

Addon original de **Cube**. Ver `readme.txt` para los créditos
completos del autor original.
