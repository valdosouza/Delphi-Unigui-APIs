inherited TasOrderPacking: TTasOrderPacking
  ClientHeight = 515
  ClientWidth = 754
  Caption = 'Tarefa de Romaneio'
  OnDestroy = UniFormDestroy
  ExplicitWidth = 770
  ExplicitHeight = 574
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 451
    Width = 754
    ExplicitTop = 451
    ExplicitWidth = 754
    inherited Sb_Close: TUniSpeedButton
      ExplicitLeft = 466
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 754
    Height = 91
    Align = alTop
    ExplicitTop = 0
    ExplicitWidth = 754
    ExplicitHeight = 91
    object L_Codigo: TUniLabel
      Left = 6
      Top = 6
      Width = 44
      Height = 14
      Hint = ''
      Caption = 'N'#250'mero'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      TabOrder = 5
    end
    object E_Number: TUniEdit
      Left = 6
      Top = 21
      Width = 72
      Hint = ''
      Text = ''
      TabOrder = 0
      ReadOnly = True
    end
    object L_DtRegistry: TUniLabel
      Left = 80
      Top = 6
      Width = 69
      Height = 14
      Hint = ''
      Caption = 'Data Cadastro'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 6
    end
    object Dtp_Registry: TUniDateTimePicker
      Left = 80
      Top = 21
      Width = 116
      Hint = ''
      DateTime = 42544.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
    end
    object Ctn_Entity: TUniContainerPanel
      Left = 199
      Top = 7
      Width = 546
      Height = 37
      Hint = ''
      ParentColor = False
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object Ctn_Situation: TUniContainerPanel
      Left = 6
      Top = 47
      Width = 423
      Height = 37
      Hint = ''
      ParentColor = False
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
  end
  object pg_Items: TUniPageControl [2]
    Left = 0
    Top = 91
    Width = 754
    Height = 360
    Hint = ''
    ActivePage = tbs_List
    Align = alClient
    TabOrder = 2
    object tbs_List: TUniTabSheet
      Hint = ''
      Caption = 'Lista de Mercadoria'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object pnl_Order_Item: TUniPanel
        Left = 0
        Top = 0
        Width = 746
        Height = 332
        Hint = ''
        Align = alClient
        TabOrder = 0
        BorderStyle = ubsFrameLowered
        Caption = ''
        object Ctn_Order_Items_Packing: TUniContainerPanel
          Left = 2
          Top = 2
          Width = 742
          Height = 328
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 1
        end
      end
    end
    object tbs_other: TUniTabSheet
      Hint = ''
      Caption = 'Outras Informa'#231#245'es'
      object UniPanel2: TUniPanel
        Left = 0
        Top = 0
        Width = 746
        Height = 332
        Hint = ''
        Align = alClient
        TabOrder = 0
        BorderStyle = ubsFrameLowered
        Caption = ''
        DesignSize = (
          746
          332)
        object M_note: TUniMemo
          Left = 3
          Top = 19
          Width = 738
          Height = 106
          Hint = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object UniLabel13: TUniLabel
          Left = 6
          Top = 4
          Width = 83
          Height = 14
          Hint = ''
          Caption = 'Prazo de Entrega'
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          TabOrder = 2
        end
        object chbx_approved: TUniCheckBox
          Left = 6
          Top = 127
          Width = 85
          Height = 17
          Hint = ''
          Caption = 'Aprovado'
          TabOrder = 3
        end
      end
    end
    object tbs_delivery: TUniTabSheet
      Hint = ''
      Caption = 'Entrega'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object Ctn_Shipping: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 746
        Height = 332
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 0
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    inherited MnuTarefas: TUniMenuItem
      object ListDelivery: TUniMenuItem
        AutoCheck = True
        Caption = 'Itens para entregar'
        OnClick = ListDeliveryClick
      end
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
