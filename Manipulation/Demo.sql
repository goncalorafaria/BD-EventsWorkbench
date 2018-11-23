USE EventsWorkbench;# RE1 arg:numorg

### Testar
Select *
From Entidade;

Select *
From Local;

Select *
From Organizador;

Select *
From Participante;

Select *
From Evento;

Select *
From PermiteEntrada_Evento_Participante_Divulgacao;

Select *
From Divulgacao;

##RE1 arg:numorg =5
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
Select distinct
    Ent.nome, Ent.endereco, Ent.email, Ent.telemovel
From
    Evento as E,
    Organizador as O,
    Organizador_has_Evento as OE,
    PermiteEntrada_Evento_Participante_Divulgacao as PEPD,
    Participante as P,
	Entidade as Ent
where
    E.id = OE.Evento_id
    and OE.Organizador_Entidade_id = 5
    and PEPD.Evento_id = E.id
    and P.Entidade_id = PEPD.Participante_Entidade_id
	and Ent.id = P.Entidade_id;
    
# RE2 arg:numorg=5
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
Select distinct
    P.*
From
    Evento as E,
    Organizador as O,
    Organizador_has_Evento as OE,
    Divulgacao as D,
    Plataforma as P
where
    E.id = OE.Evento_id
    and OE.Organizador_Entidade_id = 5
    and D.Evento_id = E.id
    and D.Plataforma_id = P.id;

# RE3 arg:numorg = 5
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
Select distinct
    E.*, L.Tipo
From
    Evento as E,
    Organizador as O,
    Organizador_has_Evento as OE,
	Local as L
where
    E.id = OE.Evento_id
    and OE.Organizador_Entidade_id = 5
	and L.Entidade_id = L.Entidade_id;

# RE4 arg:numorg=4, numevento=1
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
Select distinct
    E.*
From
    Evento as E,
    Organizador as O,
    Organizador_has_Evento as OE
where
    E.id = OE.Evento_id
    and OE.Organizador_Entidade_id = 4
	and E.id = 1;

# RE5 numevento =2
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR

Select distinct
    E.id,P.genero,P.nif,P.datadenascimento,Ent.nome, Ent.endereco, Ent.email, Ent.telemovel
From
    Evento as E,
    PermiteEntrada_Evento_Participante_Divulgacao as PEPD,
    Participante as P,
	Entidade as Ent
where
	E.id = 2
    and PEPD.Evento_id = E.id
    and P.Entidade_id = PEPD.Participante_Entidade_id
	and Ent.id = P.Entidade_id;

# RE6 numevento = 3
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
Select distinct
    E.id,P.genero,P.nif,P.datadenascimento,Ent.nome, Ent.endereco, Ent.email, Ent.telemovel
From
    Evento as E,
    PermiteEntrada_Evento_Participante_Divulgacao as PEPD,
    Participante as P,
	Entidade as Ent
where
	E.id = 3
    and PEPD.Evento_id = E.id
    and P.Entidade_id = PEPD.Participante_Entidade_id
	and Ent.id = P.Entidade_id;

#RE7 Data: dinf, dsup = '1988-3-3'
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
Select *
From 
	Evento as E
where 
	E.data between '1988-3-3'
	and E.data <= '1988-3-3';

#RE7 idLocal :idl=2
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
Select *
From 
	Evento as E
where 
	E.Local_Entidade_Id = 2;

#RE8
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
Select
	D.tipo, count(D.tipo)
From 
	Divulgacao as D,
	PermiteEntrada_Evento_Participante_Divulgacao as PEPD
where
	PEPD.Divulgacao_id = D.id 
group by D.tipo
order by count(D.tipo) DESC;

## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR

Select 
	D.tipo, sum(D.Custo)/count(D.Custo) as EntParticipante
From 
	Divulgacao as D
group by D.tipo
order by sum(D.Custo)/count(D.Custo);

#RE9 arg:divid =2
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR

Select 
	D.*
From 
	Divulgacao as D
where
	D.id = 2;
    
#RE10
#arg:divid =2
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
## ESTÁ A FUNCIONAR
Select 
	D.*, count(PEPD.Participante_Entidade_Id)
From 
	Divulgacao as D,
    PermiteEntrada_Evento_Participante_Divulgacao as PEPD
where
	PEPD.Divulgacao_id = D.id
	and D.id = 2
group by Divulgacao_id