# atividade-sistema-solar

Atividade Prática – Sistema Solar com Planetas e Luas

## Etapa 4

1. **Onde aplicamos pushMatrix()/popMatrix() e por quê?**
   - No draw() da Classe SolarSystem: isola o translate do Sol para o centro da tela
   - Em Planet.display() : isola as transformações de cada planeta
   - Em Moon.display(): isola as transformações de cada lua
     Motivo: cada popMatrix() "desfaz" as transformações, evitando que um objeto afete o próximo.

2. **O que mudaria se invertêssemos rotate() e translate() no planeta ou na lua**
   - Ao inverter a ordem de execução no Planeta, os planetas não se mexem
   - Ao inverter a ordem de execução na Lua, as luas não se mexeriam em órbita, só acompanhariam o planeta
   - Basicamente ao inverter os elementos giram em torno do proprio eixo

3. **Como garantimos órbitas independentes?**
   - Cada objeto tem seu próprio theta e orbitspeed (estado separado)
   - O update() incrementa theta independentemente para cada planeta/lua
   - O pushMatrix()/popMatrix() salva e restaura o sistema de coordenadas entre objetos e garantem que os objetos calculem a partir de uma mesma origem, não a partir do ponto do registro anterior.
