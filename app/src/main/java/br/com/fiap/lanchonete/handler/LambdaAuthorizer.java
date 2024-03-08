package br.com.fiap.lanchonete.handler;

import br.com.fiap.lanchonete.response.PolicyDocument;
import br.com.fiap.lanchonete.response.Response;
import br.com.fiap.lanchonete.response.Statement;
import br.com.fiap.lanchonete.util.JWTUtil;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.lambda.runtime.events.APIGatewayProxyRequestEvent;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;

public class LambdaAuthorizer implements RequestHandler<APIGatewayProxyRequestEvent, Response> {
    static Logger logger = Logger.getLogger(LambdaAuthorizer.class.getName());
    public Response handleRequest(APIGatewayProxyRequestEvent event, Context context) {
        logger.info("Request lambda authorizer:"+System.currentTimeMillis());
        Map<String, String> headers = event.getHeaders();
        String authorizationToken = headers.get("Authorization");
        logger.info("Request lambda authorizer token:"+authorizationToken);
        String auth = "Deny";
        String sub = JWTUtil.getSub(authorizationToken);
        if (sub != null) {

            auth = "Allow";
            logger.info("TOKEN OK");
        }else{
            logger.info("TOKEN INVALID");
        }

        Map<String, String> ctx = new HashMap<String, String>();
        ctx.put("sub", sub);

        APIGatewayProxyRequestEvent.ProxyRequestContext proxyContext = event.getRequestContext();
        APIGatewayProxyRequestEvent.RequestIdentity identity = proxyContext.getIdentity();


        String arn = String.format("arn:aws:execute-api:%s:%s:%s/%s/%s/%s",System.getenv("AWS_REGION"), proxyContext.getAccountId(),
                proxyContext.getApiId(), proxyContext.getStage(), proxyContext.getHttpMethod(), "*");

        Statement statement = Statement.builder().effect(auth).resource(arn).build();

        PolicyDocument policyDocument = PolicyDocument.builder().statements(Collections.singletonList(statement))
                .build();

        return Response.builder().principalId(identity.getAccountId()).policyDocument(policyDocument)
                .context(ctx).build();
    }
}