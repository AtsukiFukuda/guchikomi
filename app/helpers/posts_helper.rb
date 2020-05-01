module PostsHelper
    def  getPercent(number) 
        calPercent = number/5.to_f * 106
      # calPercent = number/10.to_f * 100
      #↑１０段階評価の際は2行目コメントアウトを外して、1行目をコメントアウト。
        percent = calPercent.round
      #↑CSSは小数が含まれると、widthの幅を指定できないので四捨五入して整数化。
        return percent.to_s
    end
end
