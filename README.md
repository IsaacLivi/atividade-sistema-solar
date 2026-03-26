# atividade-sistema-solar

Atividade Prática – Sistema Solar com Planetas e Luas

## Etapa 1

![Diagrama](etapas/etapa1.png)

## Etapa 2

- O método `draw()` é executado em loop, chamando `update()` para cada planeta. Cada um deles atualiza seu próprio theta e então chama o `update()` da sua respectiva lua.
- A variável _theta_ é incrementada ou decrementada dentro do método `update()` de ambas as classes, através da instrução `theta += orbitspeed;`.
- A variável _orbitspeed_ define a taxa de variação do ângulo a cada quadro de animação, atuando como a velocidade angular. Sendo assim, quanto maior o valor absoluto de _orbitspeed_, mais rápido o objeto completará sua órbita.
- A classe _Planet_ define sua _orbitspeed_ sempre com valores positivos, variando de 0.01 a 0.03, enquanto a classe _Moon_ possui uma velocidade aleatória entre -0.1 e 0.1. Como o sistema de coordenadas do Processing tem o eixo Y apontando para baixo, valores positivos de rotação geram um movimento no sentido horário e valores negativos geram movimento no sentido anti-horário.

## Etapa 4

1. **Onde aplicamos pushMatrix()/popMatrix() e por quê?**

- No `draw()` da Classe _SolarSystem_: isola o translate do Sol para o centro da tela
- Em `Planet.display()` : isola as transformações de cada planeta
- Em `Moon.display()`: isola as transformações de cada lua
- Motivo: cada `popMatrix()` "desfaz" as transformações, evitando que um objeto afete o próximo.

2. **O que mudaria se invertêssemos rotate() e translate() no planeta ou na lua**

- Ao inverter a ordem de execução no Planeta, os planetas não fazem o movimento da órbita.
- Ao inverter a ordem de execução na Lua, as luas não se mexem em órbita, só acompanhariam o planeta.
- Basicamente ao inverter os elementos giram em torno do proprio eixo.

3. **Como garantimos órbitas independentes?**

- Cada objeto tem seu próprio _theta_ e _orbitspeed_ (estado separado).
- O `update()` incrementa theta independentemente para cada planeta/lua.
- O `pushMatrix()/popMatrix()` salva e restaura o sistema de coordenadas entre objetos e garantem que os objetos calculem a partir de uma mesma origem, não a partir do ponto do registro anterior.
