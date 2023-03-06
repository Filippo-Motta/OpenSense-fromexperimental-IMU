function [Basic,RT,RS,RF,LT,LS,LF]=Taglio(Basic,RT,RS,RF,LT,LS,LF,inizio,fine)
Basic=Basic(inizio:fine,:);
RT=RT(inizio:fine,:);
RF=RF(inizio:fine,:);
RS=RS(inizio:fine,:);
LF=LF(inizio:fine,:);
LS=LS(inizio:fine,:);
LT=LT(inizio:fine,:);