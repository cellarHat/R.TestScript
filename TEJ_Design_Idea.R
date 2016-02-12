#design of TEJ analyzer can be defined as library header, data extractor, parser, calculator, and stacker.
#library header just need know dependency of sub-rutine. it's can be kepp in each function, but need mind
#about name-crash.
#data extractor and stacker is stable and repeatable, wchich just need be take onece.
#calculator is core of script. can repeat by good parser because it's more target-drived.
