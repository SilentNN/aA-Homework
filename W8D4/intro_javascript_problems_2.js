function titleize(array, callback) {
    mapped = array.map(
        (ele) => `Mx. ${ele} Jingleheimer Schmidt`
    )

    mapped.forEach(
        callback
    )
}

function printCallback(arg) {
    console.log(arg);
}

// titleize(["Mary", "Brian", "Leo"], printCallback)

function Elephant(name, height, tricks) {
    this.name = name;
    this.height = height;
    if (tricks) {
        this.tricks = tricks;
    } else {
        this.tricks = []
    }
}

// ["painting a picture", "rolling over", "laughing at your joke"]

Elephant.prototype.trumpet = function() {
    console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
}

Elephant.prototype.grow = function() {
    height = height + 12;
}

Elephant.prototype.addTrick = function(trick) {
    this.tricks.push(trick);
}

Elephant.prototype.play = function() {
    i = Math.floor(Math.random() * this.tricks.length);
    console.log(`${this.name} is ${this.tricks[i]}!`);
}

ellie = new Elephant("Ellie", 6)
ellie.trumpet()
ellie.addTrick("painting a picture")
ellie.play()
ellie.addTrick("giving human friends a ride")
ellie.addTrick("playing hide and seek")
ellie.addTrick("spraying water for a slip and slide")
ellie.addTrick("stealing peanuts")
ellie.play()