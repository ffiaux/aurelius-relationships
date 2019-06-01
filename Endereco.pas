unit Endereco;

interface

uses
  Aurelius.Mapping.Attributes, Aurelius.Types.Proxy, System.Generics.Collections, Aluno;

type
  [Entity, Automapping]
  [Table('Enderecos')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TEndereco = class
    private
      FId: Integer;
      FLogradouro : String;
      FCidade : String;
      FBairro : String;
      FCep : String;
      FEstado : String;

      [Association([TAssociationProp.Lazy])]
      [JoinColumn('AlunoID', [])]
      FAluno : Proxy<TAluno>;
    public
      property ID : Integer read FId write FId;
      property Logradouro : String read FLogradouro write FLogradouro;
      property Cidade : String read FCidade write FCidade;
      property Cep : String read FCep write FCep;
      property Estado : String read FEstado write FEstado;
      property Aluno : Proxy<TAluno> read FAluno write FAluno;
  end;

implementation

end.