// priority: 0

// Visit the wiki for more info - https://kubejs.com/

console.info('Hello, World! (Loaded startup scripts)')

StartupEvents.registry('item', e => {
    // The texture for this item has to be placed in kubejs/assets/kubejs/textures/item/test_item.png
    // If you want a custom item model, you can create one in Blockbench and put it in kubejs/assets/kubejs/models/item/test_item.json
    e.create('test_item')
    
    // If you want to specify a different texture location you can do that too, like this:
    e.create('wiress_rerminal').texture('sdm:item/wiress_terminal') // This texture would be located at kubejs/assets/mobbo/textures/item/lava.png
  })