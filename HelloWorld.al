pageextension 50100 CustomerListExt extends "Customer List"
{
    actions
    {
        addlast(processing)
        {
            action(TestJson)
            {
                ApplicationArea = All;
                Caption = 'Test Json';

                trigger OnAction()
                var
                    JsonText: Text;
                begin
                    JsonText := '{"firstName":"John","lastName":"doe","age":26,"address":{"streetAddress":"naist street","city":"Nara","postalCode":"630-0192"},"phoneNumbers":[{"type":"iPhone","number":"0123-4567-8888"},{"type":"home","number":"0123-4567-8910"}]}';

                    JsonAddToArray();
                    JsonTheNewWay(JsonText);
                    JsonTheOldWay(JsonText);
                end;
            }
        }
    }

    local procedure JsonAddToArray()
    var
        JsonObject: Codeunit JsonObject;
        JsonArray: Codeunit JsonArray;
    begin
        JsonObject
            .Add('firstName', 'John')
            .Add('lastName', 'Doe')
            .Add('age', 26);

        JsonObject.InitObjectProperty('address')
            .Add('streetAddress', 'naist street')
            .Add('city', 'Nara')
            .Add('postalCode', '630-0192');

        JsonArray := JsonObject.InitArrayProperty('phoneNumbers');

        JsonArray.InitObjectProperty().Add('type', 'iPhone').Add('number', '0123-4567-8888');
        JsonArray.InitObjectProperty().Add('type', 'home').Add('number', '0123-4567-8910');
        JsonArray.Add('hello world');

        Message(JsonObject.AsText());
    end;

    local procedure JsonTheNewWay(JsonText: Text)
    var
        JsonObject, PhoneNumberObj : Codeunit JsonObject;
    begin
        JsonObject.Initialize(JsonText);

        foreach PhoneNumberObj in JsonObject.GetArray('phoneNumbers').GetObjects() do
            Message('The New Way: %1', PhoneNumberObj.GetText('number'));

        Message('The New Way: %1', JsonObject.GetArray('phoneNumbers').GetObject(0).GetText('number'));
    end;

    local procedure JsonTheOldWay(JsonText: Text)
    var
        JsonObj: JsonObject;
        phoneNumbersToken: JsonToken;
        phoneNumberObjectToken: JsonToken;
        phoneNumberToken: JsonToken;
    begin
        JsonObj.ReadFrom(JsonText);
        JsonObj.Get('phoneNumbers', phoneNumbersToken);
        phoneNumbersToken.AsArray().Get(0, phoneNumberObjectToken);
        phoneNumberObjectToken.AsObject().Get('number', phoneNumberToken);

        Message('The Old Way: %1', phoneNumberToken.AsValue().AsText());
    end;
}