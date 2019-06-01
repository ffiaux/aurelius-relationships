program AureliusRelationships;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Aluno in 'Aluno.pas',
  Aurelius.Drivers.MSSQL,
  Aurelius.Drivers.Interfaces,
  Aurelius.Engine.ObjectManager,
  System.Generics.Collections,
  Aurelius.Criteria.Base,
  Aurelius.Criteria.Linq,
  Endereco in 'Endereco.pas';

var
  MyConnection: IDBConnection;
  Manager: TObjectManager;
  Endereco: TEndereco;

begin
  try
    MyConnection := TMSSQLConnection.Create('Server=.\SQLEXPRESS;Database=HibernateTest;TrustedConnection=True');
    Manager := TObjectManager.Create(MyConnection);

    Endereco := Manager.Find<TEndereco>(1);
    Writeln(Endereco.Logradouro);
    Writeln(Endereco.Aluno.Value.Nome);

    Endereco := Manager.Find<TEndereco>(2);
    Writeln(Endereco.Logradouro);
    Writeln(Endereco.Aluno.Value.Nome);

    Endereco := Manager.Find<TEndereco>(3);
    Writeln(Endereco.Logradouro);
    Writeln(Endereco.Aluno.Value.Nome);

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
