class Brainfucker
  def self.load(c, i="", o=STDOUT)
    l=c.length
    mp,cp,ip,bc=[0,0,0,0]
    m=[0]
    until cp==l
      case c[cp]
      when "+" then m[mp]=(m[mp]+1)%256
      when "-" then m[mp]=(m[mp]-1)%256
      when ">" then (mp=(mp+1)%256)&&(m[mp]||=0)
      when "<" then (mp=(mp-1)%256)&&(m[mp]||=0)
      when "." then o.print(m[mp].chr)
      when "," then m[mp]=(i[-1+ip+=1]||0).ord
      when "[" then m[mp]==0&&(cp+=1)&&(until c[cp]=="]"&&bc==0;c[cp]=="["&&bc+=1;c[cp]=="]"&&bc-=1;cp+=1;end)
      when "]" then m[mp]!=0&&(cp-=1)&&(until c[cp]=="["&&bc==0;c[cp]=="]"&&bc+=1;c[cp]=="["&&bc-=1;cp-=1;end)
      end
      cp +=1
    end
  end
end