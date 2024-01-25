# RISC-V Processor With branch Prediction

This is a verilog code for a 5-stage pipelined RISC-V Processor with forwarding functionality and Branch Prediction. Here is the circuit diagramme of the processor.



## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

For simulation purpose, you can install ```ModelSim``` or any other simulation tool that supports Verilog HDL. 

### Installing

Once you have ```ModelSim``` launched, change your working directory to this project's directory using the following command in transcript window.

```
cd "[/path/to/directory]/PipelinedProcessor"
```

And run the simulation by running

```
do run.do
```
You can instead open the project file by running

```
project open  "[/path/to/directory]/PipelinedProcessor/ECE_562"
```

After the simulation ends, you can see the simulation waves in the simulator. You can also change the benchmark in ```Instruction_Memory.v``` or you can change
the branch predictor by modifying the Predictor unit in the ```RISC_V_Processor.v``` file can simply be changed from a Branch_Predictor module to either a Branch_Predictornone or a Branch_Predictor1bit module. None of the wirings change between the different predictors.
. 

**Note**: Do not check the dependency of a load instruction result on the next instruction, as the architecture does not support stalling.


## Acknowledgments

* Habib University for the course on Computer-Architecture
* @hasanbaig for step-by-step well-formatted excercises to build this circuit.
* @MMujtabaRoohani for a base RISC-V processor to make additions to.

