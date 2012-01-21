/*
   * dna.d
   * Copyright (c) 2012 George Githinji
   * A module to represent a DNA sequence
   * This a pre-alpha version of a  bio library with the D language
   */

module dna;

import std.stdio;
import std.string;
import std.conv;
import std.array;

struct nucleotide {
  public:
    /* initialize a base */
    this(char base){
      this.base = base;
    }

    /* read a base*/
    pure char get_base(){
      return base;
    }

    bool opCmp(nucleotide c){
      return base == c.base;
    }

    //string to_string(){
      //return to!String(base)
    //}

    /* private identifier */
  private:
    char base;
};


/* define nucleotide as the basic type for all nucleotide residues */
enum nucleotide_bases : nucleotide {N = nucleotide('N'), A = nucleotide('A'), T = nucleotide('T'), C = nucleotide('C'), G = nucleotide('G') };


/* a dna sequence is an array of nucleotides */
alias nucleotide[] dna_sequence;


/* reads a stream of characters and convert to a nucleotides sequence
   need to add error checking so only valid nucleotide bases are accepted */
dna_sequence to_dna(string str) {
  dna_sequence seq;
  foreach(char c; str.toUpper) {
    seq ~= cast(nucleotide)(c);
  }
  return seq;
}

 
/* check if a base is a valid nucleotide character */
bool is_nucleotide(char base){
  if (base == nucleotide_bases.A.get_base()) return true;
  if (base == nucleotide_bases.T.get_base()) return true;
  if (base == nucleotide_bases.G.get_base()) return true;
  if (base == nucleotide_bases.C.get_base()) return true;
  if (base == nucleotide_bases.N.get_base()) return true;
  writefln("Error: Unrecognised nucleotide base: %s", base);
  return false;
}


/*complement a nucleotide base */
pure nucleotide complement(nucleotide base){
  switch(base.get_base()){
    case nucleotide_bases.A.get_base(): 
      return nucleotide_bases.T;
      break;
    case nucleotide_bases.T.get_base(): 
      return nucleotide_bases.A;
      break;
    case nucleotide_bases.G.get_base(): 
      return nucleotide_bases.C; 
      break;
    case nucleotide_bases.C.get_base(): 
      return nucleotide_bases.G; 
      break;
    case nucleotide_bases.N.get_base(): 
      return nucleotide_bases.N; 
      break;
    default:
      // return N for illegal/unknown nucleotides
      return nucleotide_bases.N;
      break;
  }
  assert(0);
}