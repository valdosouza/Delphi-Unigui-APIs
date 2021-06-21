inherited TasOrderStockTransfer: TTasOrderStockTransfer
  ClientHeight = 513
  ClientWidth = 760
  Caption = 'Transfer'#234'ncia de Estoque'
  Menu = nil
  ExplicitWidth = 776
  ExplicitHeight = 552
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 449
    Width = 760
    ExplicitTop = 449
    ExplicitWidth = 760
  end
  inherited pnl_fundo: TUniPanel
    Width = 760
    Height = 57
    Align = alTop
    ExplicitTop = 0
    ExplicitWidth = 760
    ExplicitHeight = 57
    object L_Codigo: TUniLabel
      Left = 6
      Top = 7
      Width = 44
      Height = 14
      Hint = ''
      Caption = 'N'#250'mero'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      TabOrder = 1
    end
    object E_Number: TUniEdit
      Left = 6
      Top = 21
      Width = 72
      Hint = ''
      Text = ''
      TabOrder = 2
      ReadOnly = True
    end
    object L_DtRegistry: TUniLabel
      Left = 80
      Top = 7
      Width = 69
      Height = 14
      Hint = ''
      Caption = 'Data Cadastro'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 3
    end
    object Dtp_Registry: TUniDateTimePicker
      Left = 80
      Top = 21
      Width = 116
      Hint = ''
      DateTime = 42544.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 4
    end
    object Ctn_Entity: TUniContainerPanel
      Left = 199
      Top = 9
      Width = 557
      Height = 37
      Hint = ''
      ParentColor = False
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
    end
  end
  object pg_statement: TUniPageControl [2]
    Left = 0
    Top = 57
    Width = 760
    Height = 392
    Hint = ''
    ActivePage = tbs_inputs
    Align = alClient
    TabOrder = 2
    object UniTabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'Lista de Mercadoria'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object UniPanel4: TUniPanel
        Left = 0
        Top = 0
        Width = 752
        Height = 364
        Hint = ''
        Align = alClient
        TabOrder = 0
        BorderStyle = ubsFrameLowered
        Caption = ''
        object Ctn_Stock_Transfer: TUniContainerPanel
          Left = 2
          Top = 2
          Width = 748
          Height = 360
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 1
        end
      end
    end
    object tbs_inputs: TUniTabSheet
      Hint = ''
      Caption = 'Outras Informa'#231#245'es'
      object UniPanel1: TUniPanel
        Left = 0
        Top = 0
        Width = 752
        Height = 364
        Hint = ''
        Align = alClient
        TabOrder = 0
        BorderStyle = ubsFrameLowered
        Caption = ''
        DesignSize = (
          752
          364)
        object Ctn_Stock_Id_Des: TUniContainerPanel
          Left = 6
          Top = 57
          Width = 418
          Height = 43
          Hint = ''
          ParentColor = False
          TabOrder = 1
        end
        object Ctn_Stock_Id_Ori: TUniContainerPanel
          Left = 6
          Top = 8
          Width = 418
          Height = 43
          Hint = ''
          ParentColor = False
          TabOrder = 2
        end
        object M_note: TUniMemo
          Left = 6
          Top = 118
          Width = 418
          Height = 81
          Hint = ''
          Lines.Strings = (
            'M_note')
          TabOrder = 3
        end
        object UniLabel1: TUniLabel
          Left = 6
          Top = 103
          Width = 65
          Height = 14
          Hint = ''
          Caption = 'Observa'#231#227'o'
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          TabOrder = 4
        end
        object Ctn_Situacao: TUniContainerPanel
          Left = 430
          Top = 8
          Width = 319
          Height = 43
          Hint = ''
          ParentColor = False
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
        end
      end
    end
    object Entrega: TUniTabSheet
      Hint = ''
      Caption = 'Entrega'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object Ctn_Shipping: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 752
        Height = 364
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 0
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 528
    Top = 216
    inherited MnuTarefas: TUniMenuItem
      object NotaFiscal1: TUniMenuItem
        Caption = 'Nota Fiscal'
        OnClick = NotaFiscal1Click
      end
      object Copiaritens1: TUniMenuItem
        Caption = 'Copiar itens'
        OnClick = Copiaritens1Click
      end
    end
  end
end
