var relicEnum = {
	LITH: 1,
	MESO: 2,
	NEO: 3,
	AXI: 4,
};

class PrimePart {
	
	constructor(newName, newRelicEnum, newRelicName, newDucatValue) {
		this.name = newName;
		this.relicTier=newRelicEnum;
		this.relicName=newRelicName;
		this.ducatValue=newDucatValue;
	}
	
	getName() {
		return this.name;
	}
	
	getRelicTier() {
		return this.relicTier;
	}
	
	getRelicName() {
		return this.relicName;
	}
	
	getDucatValue() {
		return this.ducatValue;
	}
}