codeunit 50100 JsonObject
{
    var
        JObject: JsonObject;

    procedure Initialize(JsonText: Text)
    begin
        this.JObject.ReadFrom(JsonText);
    end;

    procedure Initialize(JsonObject: JsonObject)
    begin
        this.JObject := JsonObject;
    end;

    procedure GetJsonObject(): JsonObject
    begin
        exit(this.JObject);
    end;

    procedure AsText(): Text
    begin
        exit(Format(this.JObject));
    end;

    #region Get

    procedure GetText(ObjectKey: Text): Text
    var
        Value: JsonToken;
    begin
        this.JObject.Get(ObjectKey, Value);
        exit(Value.AsValue().AsText());
    end;

    procedure GetInteger(ObjectKey: Text): Integer
    var
        Value: JsonToken;
    begin
        this.JObject.Get(ObjectKey, Value);
        exit(Value.AsValue().AsInteger());
    end;

    procedure GetDecimal(ObjectKey: Text): Decimal
    var
        Value: JsonToken;
    begin
        this.JObject.Get(ObjectKey, Value);
        exit(Value.AsValue().AsDecimal());
    end;

    procedure GetBoolean(ObjectKey: Text): Boolean
    var
        Value: JsonToken;
    begin
        this.JObject.Get(ObjectKey, Value);
        exit(Value.AsValue().AsBoolean());
    end;

    procedure GetDateTime(ObjectKey: Text): DateTime
    var
        Value: JsonToken;
    begin
        this.JObject.Get(ObjectKey, Value);
        exit(Value.AsValue().AsDateTime());
    end;

    procedure GetArray(ObjectKey: Text) Return: Codeunit JsonArray
    var
        Value: JsonToken;
    begin
        this.JObject.Get(ObjectKey, Value);
        Return.Initialize(Value.AsArray());
    end;

    procedure GetObject(ObjectKey: Text) Return: Codeunit JsonObject
    var
        Value: JsonToken;
    begin
        this.JObject.Get(ObjectKey, Value);
        Return.Initialize(Value.AsObject());
    end;

    procedure GetBigInteger(ObjectKey: Text): BigInteger
    var
        Value: JsonToken;
    begin
        this.JObject.Get(ObjectKey, Value);
        exit(Value.AsValue().AsBigInteger());
    end;

    procedure GetCode(ObjectKey: Text): Text
    var
        Value: JsonToken;
    begin
        this.JObject.Get(ObjectKey, Value);
        exit(Value.AsValue().AsCode());
    end;

    procedure GetByte(ObjectKey: Text): Byte
    var
        Value: JsonToken;
    begin
        this.JObject.Get(ObjectKey, Value);
        exit(Value.AsValue().AsByte());
    end;

    procedure GetChar(ObjectKey: Text): Char
    var
        Value: JsonToken;
    begin
        this.JObject.Get(ObjectKey, Value);
        exit(Value.AsValue().AsChar());
    end;

    procedure GetDate(ObjectKey: Text): Date
    var
        Value: JsonToken;
    begin
        this.JObject.Get(ObjectKey, Value);
        exit(Value.AsValue().AsDate());
    end;

    procedure GetDuration(ObjectKey: Text): Duration
    var
        Value: JsonToken;
    begin
        this.JObject.Get(ObjectKey, Value);
        exit(Value.AsValue().AsDuration());
    end;

    procedure GetOption(ObjectKey: Text): Option
    var
        Value: JsonToken;
    begin
        this.JObject.Get(ObjectKey, Value);
        exit(Value.AsValue().AsOption());
    end;

    #endregion

    #region Add

    procedure Add(ObjectKey: Text; Value: Variant): Codeunit JsonObject
    var
        JsonArray: Codeunit JsonArray;
        JsonObject: Codeunit JsonObject;
    begin
        case true of
            Value.IsText(), Value.IsCode():
                this.AddText(ObjectKey, Value);
            Value.IsJsonArray:
                this.AddJsonArray(ObjectKey, Value);
            Value.IsJsonObject():
                this.AddJsonObject(ObjectKey, Value);
            Value.IsBigInteger():
                this.AddBigInteger(ObjectKey, Value);
            Value.IsByte():
                this.AddByte(ObjectKey, Value);
            Value.IsChar():
                this.AddChar(ObjectKey, Value);
            Value.IsDate():
                this.AddDate(ObjectKey, Value);
            Value.IsDuration():
                this.AddDuration(ObjectKey, Value);
            Value.IsOption(), Value.IsInteger():
                this.AddInteger(ObjectKey, Value);
            Value.IsDecimal():
                this.AddDecimal(ObjectKey, Value);
            Value.IsBoolean():
                this.AddBoolean(ObjectKey, Value);
            Value.IsDateTime():
                this.AddDateTime(ObjectKey, Value);
            Value.IsCodeunit():
                begin
                    if Evaluate(JsonArray, Value) then
                        this.AddJsonArrayCodeunit(ObjectKey, JsonArray);
                    if Evaluate(JsonObject, Value) then
                        this.AddJsonObjectCodeunit(ObjectKey, JsonObject);
                end;

            else
                Error('Unsupported Type');
        end;

        exit(this);
    end;


    local procedure AddText(ObjectKey: Text; Value: Text)
    begin
        this.JObject.Add(ObjectKey, Value);
    end;

    local procedure AddJsonArray(ObjectKey: Text; Value: JsonArray)
    begin
        this.JObject.Add(ObjectKey, Value);
    end;

    local procedure AddJsonObject(ObjectKey: Text; Value: JsonObject)
    begin
        this.JObject.Add(ObjectKey, Value);
    end;

    local procedure AddBigInteger(ObjectKey: Text; Value: BigInteger)
    begin
        this.JObject.Add(ObjectKey, Value);
    end;

    local procedure AddByte(ObjectKey: Text; Value: Byte)
    begin
        this.JObject.Add(ObjectKey, Value);
    end;

    local procedure AddChar(ObjectKey: Text; Value: Char)
    begin
        this.JObject.Add(ObjectKey, Value);
    end;

    local procedure AddDate(ObjectKey: Text; Value: Date)
    begin
        this.JObject.Add(ObjectKey, Value);
    end;

    local procedure AddDuration(ObjectKey: Text; Value: Duration)
    begin
        this.JObject.Add(ObjectKey, Value);
    end;

    local procedure AddInteger(ObjectKey: Text; Value: Integer)
    begin
        this.JObject.Add(ObjectKey, Value);
    end;

    local procedure AddDecimal(ObjectKey: Text; Value: Decimal)
    begin
        this.JObject.Add(ObjectKey, Value);
    end;

    local procedure AddBoolean(ObjectKey: Text; Value: Boolean)
    begin
        this.JObject.Add(ObjectKey, Value);
    end;

    local procedure AddDateTime(ObjectKey: Text; Value: DateTime)
    begin
        this.JObject.Add(ObjectKey, Value);
    end;

    local procedure AddJsonArrayCodeunit(ObjectKey: Text; Value: Codeunit JsonArray)
    begin
        this.JObject.Add(ObjectKey, Value.GetJsonArray());
    end;

    local procedure AddJsonObjectCodeunit(ObjectKey: Text; Value: Codeunit JsonObject)
    begin
        this.JObject.Add(ObjectKey, Value.GetJsonObject());
    end;

    #endregion 

    #region Replace

    procedure Replace(ObjectKey: Text; Value: Variant)
    var
        JsonArray: Codeunit JsonArray;
        JsonObject: Codeunit JsonObject;
    begin
        case true of
            Value.IsText(), Value.IsCode():
                this.ReplaceText(ObjectKey, Value);
            Value.IsJsonArray:
                this.ReplaceJsonArray(ObjectKey, Value);
            Value.IsJsonObject():
                this.ReplaceJsonObject(ObjectKey, Value);
            Value.IsBigInteger():
                this.ReplaceBigInteger(ObjectKey, Value);
            Value.IsByte():
                this.ReplaceByte(ObjectKey, Value);
            Value.IsChar():
                this.ReplaceChar(ObjectKey, Value);
            Value.IsDate():
                this.ReplaceDate(ObjectKey, Value);
            Value.IsDuration():
                this.ReplaceDuration(ObjectKey, Value);
            Value.IsOption(), Value.IsInteger():
                this.ReplaceInteger(ObjectKey, Value);
            Value.IsDecimal():
                this.ReplaceDecimal(ObjectKey, Value);
            Value.IsBoolean():
                this.ReplaceBoolean(ObjectKey, Value);
            Value.IsDateTime():
                this.ReplaceDateTime(ObjectKey, Value);
            Value.IsCodeunit():
                begin
                    if Evaluate(JsonArray, Value) then
                        this.ReplaceJsonArrayCodeunit(ObjectKey, JsonArray);
                    if Evaluate(JsonObject, Value) then
                        this.ReplaceJsonObjectCodeunit(ObjectKey, JsonObject);
                end;

            else
                Error('Unsupported Type');
        end;
    end;

    local procedure ReplaceText(ObjectKey: Text; Value: Text)
    begin
        this.JObject.Replace(ObjectKey, Value);
    end;

    local procedure ReplaceJsonArray(ObjectKey: Text; Value: JsonArray)
    begin
        this.JObject.Replace(ObjectKey, Value);
    end;

    local procedure ReplaceJsonObject(ObjectKey: Text; Value: JsonObject)
    begin
        this.JObject.Replace(ObjectKey, Value);
    end;

    local procedure ReplaceBigInteger(ObjectKey: Text; Value: BigInteger)
    begin
        this.JObject.Replace(ObjectKey, Value);
    end;

    local procedure ReplaceByte(ObjectKey: Text; Value: Byte)
    begin
        this.JObject.Replace(ObjectKey, Value);
    end;

    local procedure ReplaceChar(ObjectKey: Text; Value: Char)
    begin
        this.JObject.Replace(ObjectKey, Value);
    end;

    local procedure ReplaceDate(ObjectKey: Text; Value: Date)
    begin
        this.JObject.Replace(ObjectKey, Value);
    end;

    local procedure ReplaceDuration(ObjectKey: Text; Value: Duration)
    begin
        this.JObject.Replace(ObjectKey, Value);
    end;

    local procedure ReplaceInteger(ObjectKey: Text; Value: Integer)
    begin
        this.JObject.Replace(ObjectKey, Value);
    end;

    local procedure ReplaceDecimal(ObjectKey: Text; Value: Decimal)
    begin
        this.JObject.Replace(ObjectKey, Value);
    end;

    local procedure ReplaceBoolean(ObjectKey: Text; Value: Boolean)
    begin
        this.JObject.Replace(ObjectKey, Value);
    end;

    local procedure ReplaceDateTime(ObjectKey: Text; Value: DateTime)
    begin
        this.JObject.Replace(ObjectKey, Value);
    end;

    local procedure ReplaceJsonArrayCodeunit(ObjectKey: Text; Value: Codeunit JsonArray)
    begin
        this.JObject.Replace(ObjectKey, Value.GetJsonArray());
    end;

    local procedure ReplaceJsonObjectCodeunit(ObjectKey: Text; Value: Codeunit JsonObject)
    begin
        this.JObject.Replace(ObjectKey, Value.GetJsonObject());
    end;

    #endregion   

    procedure InitObjectProperty(ObjectKey: Text) Return: Codeunit JsonObject
    begin
        this.JObject.Add(ObjectKey, Return.GetJsonObject());
    end;

    procedure InitArrayProperty(ObjectKey: Text) Return: Codeunit JsonArray
    begin
        this.JObject.Add(ObjectKey, Return.GetJsonArray());
    end;
}