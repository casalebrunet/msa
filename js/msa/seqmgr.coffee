define ["cs!msa/sequence", "msa/row", "msa/selection/main",
          "cs!utils/bmath", "msa/utils"], (Sequence, Row, selection, BMath,
          Utils) ->

  class SeqManager

    constructor: (@msa) ->
      undefined
    @_generateSequence: (len) ->
      text = ""
      possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

      for i in [0..len - 1] by 1
        text += possible.charAt Math.floor(Math.random() * possible.length)
      return text

    @getDummySequences: (len, seqLen) ->
      seqs = []
      len = BMath.getRandomInt 3,5 unless len?
      seqLen = BMath.getRandomInt 50,200 unless seqLen?

      for i in [0..len - 1] by 1
        seqs.push new Sequence(SeqManager._generateSequence(seqLen), "seq" + i,
        i)
      return seqs

    addDummySequences: (len,seqLen) ->
      @msa.addSeqs SeqManager.getDummySequences(len,seqLen)
      @msa._draw()
